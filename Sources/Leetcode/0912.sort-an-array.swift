//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/24.
//
//  排序数组

import Foundation

extension Solution {
    /*
     给你一个整数数组 nums，请你将该数组升序排列。
     */
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count < 2 { return nums }
        let n: Int = nums.count
        var nums = nums

        /* 冒泡排序（Bubble Sort） */
//        for i in 0..<n - 1 {
//            for j in 0..<(n - i - 1) {
//                if nums[j] > nums[j + 1] {
//                    nums.swapAt(j, j + 1)
//                }
//            }
//        }
//        return nums

        /* 选择排序（Selection Sort） */
//        // 循环不变量：[0, i) 有序，且该区间里所有元素就是最终排定的样子
//        for i in 0..<n - 1 {
//            // 选择区间 [i, len - 1] 里最小的元素的索引，交换到下标 i
//            var minIndex = i
//            for j in (i + 1)..<n {
//                if nums[j] < nums[minIndex] {
//                    minIndex = j
//                }
//            }
//            if minIndex != i {
//                nums.swapAt(i, minIndex)
//            }
//        }
//        return nums

        /* 插入排序（Insertion Sort） */
//        // 循环不变量：将 nums[i] 插入到区间 [0, i) 使之成为有序数组
//        for i in 1..<n {
//            // 先暂存这个元素，然后之前元素逐个后移，留出空位
//            let cur = nums[i]
//            var preIndex = i - 1
//            while preIndex >= 0 && nums[preIndex] > cur {
//                nums[preIndex + 1] = nums[preIndex]
//                preIndex -= 1
//            }
//            nums[preIndex + 1] = cur
//        }
//        return nums

        /* 希尔排序（Shell Sort） */
//        var gap = n / 2
//        while gap > 0 {
//            for i in gap..<n {
//                let tmp = nums[i]
//                var j = i
//                while j >= gap && nums[j - gap] > tmp {
//                    nums[j] = nums[j - gap]
//                    j -= gap
//                }
//                nums[j] = tmp
//            }
//            gap /= 2
//        }
//        return nums

        /* 快速排序（Quick Sort） */
        func partition(_ arr: inout [Int], _ low: Int, _ high: Int) -> Int {
            let pivot = arr[high]
            var i = low
            for j in low ..< high {
                if arr[j] < pivot {
                    arr.swapAt(i, j)
                    i += 1
                }
            }
            arr.swapAt(i, high)
            return i
        }
        func random_partition(_ arr: inout [Int], _ low: Int, _ high: Int) -> Int {
            let i = Int.random(in: low ... high)
            arr.swapAt(i, high)
            return partition(&arr, low, high)
        }
        func quickSort(_ arr: inout [Int], _ low: Int, _ high: Int) {
            guard low < high else { return }
            let pivot = random_partition(&arr, low, high)
            quickSort(&arr, low, pivot - 1)
            quickSort(&arr, pivot + 1, high)
        }
        quickSort(&nums, 0, n - 1)
        return nums

        /* 归并排序（Merge Sort） */
//        func merge(_ left: [Int], _ right: [Int]) -> [Int] {
//            var res: [Int] = []
//            var i: Int = 0
//            var j: Int = 0
//            while i < left.count && j < right.count {
//                if left[i] < right[j] {
//                    res.append(left[i])
//                    i += 1
//                } else {
//                    res.append(right[j])
//                    j += 1
//                }
//            }
//            while i < left.count {
//                res.append(left[i])
//                i += 1
//            }
//            while j < right.count {
//                res.append(right[j])
//                j += 1
//            }
//            return res
//        }
//        func mergeSort(_ arr: [Int]) -> [Int] {
//            guard arr.count > 1 else { return arr }
//            let mid = arr.count / 2
//            let left = mergeSort(Array(arr[0..<mid]))
//            let right = mergeSort(Array(arr[mid..<arr.count]))
//            return merge(left, right)
//        }
//        return mergeSort(nums)

        /* 堆排序（Heap Sort） */
//        func heapify(_ nums: inout [Int], _ n: Int, _ i: Int) {
//            var largest = i
//            let left = 2 * i + 1
//            let right = 2 * i + 2
//            // If left child is larger than root
//            if left < n && nums[left] > nums[largest] {
//                largest = left
//            }
//            // If right child is larger than largest so far
//            if right < n && nums[right] > nums[largest] {
//                largest = right
//            }
//            // If largest is not root
//            if largest != i {
//                nums.swapAt(i, largest)
//                // Recursively heapify the affected sub-tree
//                heapify(&nums, n, largest)
//            }
//        }
//        // Build heap (rearrange array)
//        for i in (0...(n / 2 - 1)).reversed() {
//            heapify(&nums, n, i)
//        }
//        // Extract elements from heap one by one
//        for i in (0...(n - 1)).reversed() {
//            nums.swapAt(0, i)
//            heapify(&nums, i, 0)
//        }
//        return nums

        /* 桶排序（Bucket Sort） */
//        // 找出数组的最大值和最小值
//        var minValue: Int = 1 // nums.min() ?? 0
//        var maxValue: Int = -1 // nums.max() ?? 0
//        for num in nums {
//            minValue = min(minValue, num)
//            maxValue = max(maxValue, num)
//        }
//        // 创建桶数组
//        var buckets: [[Int]] = Array(repeating: Array<Int>(), count: maxValue - minValue + 1)
//        // 将元素分配到不同的桶中
//        for num in nums {
//            buckets[num - minValue].append(num)
//        }
//        // 对每个桶内的元素进行排序
//        var res: [Int] = []
//        for i in 0..<buckets.count {
//            var bucket = buckets[i]
//            if bucket.isEmpty {
//                continue
//            }
//            // 插入排序
//            for j in 1..<bucket.count {
//                let cur = bucket[j]
//                var k = j - 1
//                while k >= 0 && bucket[k] > cur {
//                    bucket[k + 1] = bucket[k]
//                    k -= 1
//                }
//                bucket[k + 1] = cur
//            }
//            res.append(contentsOf: bucket)
//        }
//        return res

        /* 计数排序 */
//        // 找出数组的最大值和最小值
//        var minValue: Int = 1 // nums.min() ?? 0
//        var maxValue: Int = -1 // nums.max() ?? 0
//        for num in nums {
//            minValue = min(minValue, num)
//            maxValue = max(maxValue, num)
//        }
//        var countingArray: [Int] = Array(repeating: 0, count: maxValue - minValue + 1)
//        // 统计每个元素出现的次数
//        for num in nums {
//            countingArray[num - minValue] += 1
//        }
//        // 根据计数数组重构原数组
//        var res: [Int] = []
//        for i in 0..<countingArray.count {
//            let count = countingArray[i]
//            let cur = i + minValue
//            res.append(contentsOf: Array(repeating: cur, count: count))
//        }
//        return res

        /* 基数排序（Radix Sort） */
//        var minValue: Int = 1 // nums.min() ?? 0
//        var maxValue: Int = -1 // nums.max() ?? 0
//        for num in nums {
//            minValue = min(minValue, num)
//            maxValue = max(maxValue, num)
//        }
//        let maxAbsNum = max(maxValue, -minValue) // 求得绝对值最大的值
//        var mod = 1
//        while maxAbsNum / mod > 0 {
//            var buckets: [[Int]] = Array(repeating: Array<Int>(), count: 19)
//
//            for num in nums {
//                let index = (num / mod) % 10 + 9
//                buckets[index].append(num)
//            }
//
//            var i = 0
//            for bucket in buckets {
//                for num in bucket {
//                    nums[i] = num
//                    i += 1
//                }
//            }
//            mod *= 10
//        }
//        return nums
    }
}
