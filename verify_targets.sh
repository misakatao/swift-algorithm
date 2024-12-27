#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 计数器
TOTAL=0
SUCCESS=0
FAILED=0

# 创建临时目录存放日志
LOG_DIR="build_logs"
mkdir -p "$LOG_DIR"

# 存储失败的 targets
declare -a FAILED_TARGETS=()

echo -e "${YELLOW}Starting verification of all targets...${NC}"

# 获取所有 target 名称
TARGETS=$(swift package dump-package | grep "name" | grep -v "SwiftAlgorithm" | grep -v "Utils" | cut -d'"' -f4)

# 遍历每个 target
for target in $TARGETS; do
    ((TOTAL++))
    echo -e "\n${YELLOW}Building target: $target${NC}"
    
    # 构建指定 target
    if swift build --target "$target" > "$LOG_DIR/$target.log" 2>&1; then
        echo -e "${GREEN}✓ $target built successfully${NC}"
        ((SUCCESS++))
    else
        echo -e "${RED}✗ $target build failed${NC}"
        echo -e "${RED}Error log:${NC}"
        tail -n 5 "$LOG_DIR/$target.log"
        ((FAILED++))
        FAILED_TARGETS+=("$target")
    fi
done

# 打印统计信息
echo -e "\n${YELLOW}Build Summary:${NC}"
echo -e "Total targets: $TOTAL"
echo -e "${GREEN}Successful builds: $SUCCESS${NC}"
echo -e "${RED}Failed builds: $FAILED${NC}"

# 如果有失败的构建，列出它们
if [ $FAILED -gt 0 ]; then
    echo -e "\n${RED}Failed targets:${NC}"
    for target in "${FAILED_TARGETS[@]}"; do
        echo -e "${RED}- $target${NC}"
    done
fi

# 清理日志
if [ $FAILED -eq 0 ]; then
    rm -rf "$LOG_DIR"
else
    echo -e "\n${YELLOW}Build logs are available in $LOG_DIR directory${NC}"
fi

# 设置退出状态
[ $FAILED -eq 0 ] 