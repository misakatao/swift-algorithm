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
        var nums = nums

        /* 冒泡排序（Bubble Sort） */
//        BubbleSort.sort(&nums)

        /* 选择排序（Selection Sort） */
//        SelectionSort.sort(&nums)

        /* 插入排序（Insertion Sort） */
//        InsertionSort.sort(&nums)

        /* 希尔排序（Shell Sort） */
//        ShellSort.sort(&nums)

        /* 快速排序（Quick Sort） */
//        QuickSort.sort(&nums)

        /* 归并排序（Merge Sort） */
        MergeSort.sort(&nums)

        /* 堆排序（Heap Sort） */
//        HeapSort.sort(&nums)

        /* 桶排序（Bucket Sort） */
//        BucketSort.sort(&nums)

        /* 计数排序 */
//        CountSort.sort(&nums)

        /* 基数排序（Radix Sort） */
//        RadixSort.sort(&nums)
        
        return nums
    }
}

/* 基数排序（Radix Sort） */
class RadixSort {
    static func sort(_ nums: inout [Int]) {
        
        var minValue: Int = 1 // nums.min() ?? 0
        var maxValue: Int = -1 // nums.max() ?? 0
        for num in nums {
            minValue = min(minValue, num)
            maxValue = max(maxValue, num)
        }
        let maxAbsNum = max(maxValue, -minValue) // 求得绝对值最大的值
        var mod = 1
        while maxAbsNum / mod > 0 {
            var buckets: [[Int]] = Array(repeating: Array<Int>(), count: 19)
            
            for num in nums {
                let index = (num / mod) % 10 + 9
                buckets[index].append(num)
            }
            
            var i = 0
            for bucket in buckets {
                for num in bucket {
                    nums[i] = num
                    i += 1
                }
            }
            mod *= 10
        }
    }
}

/* 计数排序 */
class CountSort {
    static func sort(_ nums: inout [Int]) {
        if nums.count < 2 { return }
        // 找出数组的最大值和最小值
        var minValue: Int = 1 // nums.min() ?? 0
        var maxValue: Int = -1 // nums.max() ?? 0
        for num in nums {
            minValue = min(minValue, num)
            maxValue = max(maxValue, num)
        }
        var countingArray: [Int] = Array(repeating: 0, count: maxValue - minValue + 1)
        // 统计每个元素出现的次数
        for num in nums {
            countingArray[num - minValue] += 1
        }
        // 根据计数数组重构原数组
        var res: [Int] = []
        for i in 0..<countingArray.count {
            let count = countingArray[i]
            let cur = i + minValue
            res.append(contentsOf: Array(repeating: cur, count: count))
        }
        nums = res
    }
}

/* 桶排序（Bucket Sort） */
class BucketSort {
    static func sort(_ nums: inout [Int]) {
        // 找出数组的最大值和最小值
        var minValue: Int = 1 // nums.min() ?? 0
        var maxValue: Int = -1 // nums.max() ?? 0
        for num in nums {
            minValue = min(minValue, num)
            maxValue = max(maxValue, num)
        }
        // 创建桶数组
        var buckets: [[Int]] = Array(repeating: Array<Int>(), count: maxValue - minValue + 1)
        // 将元素分配到不同的桶中
        for num in nums {
            buckets[num - minValue].append(num)
        }
        // 对每个桶内的元素进行排序
        var res: [Int] = []
        for i in 0..<buckets.count {
            var bucket = buckets[i]
            if bucket.isEmpty {
                continue
            }
            // 插入排序
            for j in 1..<bucket.count {
                let cur = bucket[j]
                var k = j - 1
                while k >= 0 && bucket[k] > cur {
                    bucket[k + 1] = bucket[k]
                    k -= 1
                }
                bucket[k + 1] = cur
            }
            res.append(contentsOf: bucket)
        }
        nums = res
    }
}

/* 堆排序（Heap Sort） */
class HeapSort {
    static func sort(_ nums: inout [Int]) {
        
        func heapify(_ nums: inout [Int], _ n: Int, _ i: Int) {
            var largest = i
            let left = 2 * i + 1
            let right = 2 * i + 2
            // If left child is larger than root
            if left < n && nums[left] > nums[largest] {
                largest = left
            }
            // If right child is larger than largest so far
            if right < n && nums[right] > nums[largest] {
                largest = right
            }
            // If largest is not root
            if largest != i {
                nums.swapAt(i, largest)
                // Recursively heapify the affected sub-tree
                heapify(&nums, n, largest)
            }
        }
        
        let n = nums.count
        
        // Build heap (rearrange array)
        for i in (0...(n / 2 - 1)).reversed() {
            heapify(&nums, n, i)
        }
        
        // Extract elements from heap one by one
        for i in (0...(n - 1)).reversed() {
            nums.swapAt(0, i)
            heapify(&nums, i, 0)
        }
    }
}

/* 快速排序（Quick Sort） */
class QuickSort {
    static func sort(_ nums: inout [Int]) {
        
        func partition(_ nums: inout [Int], _ lo: Int, _ hi: Int) -> Int {
            let pivot = nums[hi]
            var i = lo
            for j in lo ... hi {
                if nums[j] < pivot {
                    nums.swapAt(i, j)
                    i += 1
                }
            }
            nums.swapAt(i, hi)
            return i
        }
        
        func random_partition(_ nums: inout [Int], _ lo: Int, _ hi: Int) -> Int {
            let i = Int.random(in: lo ... hi)
            nums.swapAt(i, hi)
            return partition(&nums, lo, hi)
        }
        
        func sort(_ nums: inout [Int], _ lo: Int, _ hi: Int) {
            if lo >= hi { return }
            let pivot = random_partition(&nums, lo, hi)
            sort(&nums, lo, pivot - 1)
            sort(&nums, pivot + 1, hi)
        }
        
        sort(&nums, 0, nums.count - 1)
    }
}

/* 归并排序（Merge Sort） */
class MergeSort {
    static func sort(_ nums: inout [Int]) {
        if nums.count < 2 { return }
        
        var temp: [Int] = Array(repeating: 0, count: nums.count)
        
        func sort(_ nums: inout [Int], _ lo: Int, _ hi: Int) {
            if lo == hi { return }
            let mid = lo + (hi - lo) / 2
            sort(&nums, lo, mid)
            sort(&nums, mid + 1, hi)
            merge(&nums, lo, mid, hi)
        }
        
        func merge(_ nums: inout [Int], _ lo: Int, _ mid: Int, _ hi: Int) {
            
            for i in lo ... hi {
                temp[i] = nums[i]
            }
            
            var i = lo
            var j = mid + 1
            for p in lo ... hi {
                if i == mid + 1 {
                    nums[p] = temp[j]
                    j += 1
                } else if j == hi + 1 {
                    nums[p] = temp[i]
                    i += 1
                } else if temp[i] > temp[j] {
                    nums[p] = temp[j]
                    j += 1
                } else {
                    nums[p] = temp[i]
                    i += 1
                }
            }
        }
        
        sort(&nums, 0, nums.count - 1)
    }
    
    static func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var res: [Int] = []
        var i: Int = 0
        var j: Int = 0
        while i < left.count && j < right.count {
            if left[i] < right[j] {
                res.append(left[i])
                i += 1
            } else {
                res.append(right[j])
                j += 1
            }
        }
        while i < left.count {
            res.append(left[i])
            i += 1
        }
        while j < right.count {
            res.append(right[j])
            j += 1
        }
        return res
    }
}

/* 希尔排序（Shell Sort） */
class ShellSort {
    static func sort(_ nums: inout [Int]) {
        let len: Int = nums.count
        var gap = len / 2
        while gap > 0 {
            for i in gap ..< len {
                let tmp = nums[i]
                var j = i
                while j >= gap && nums[j - gap] > tmp {
                    nums[j] = nums[j - gap]
                    j -= gap
                }
                nums[j] = tmp
            }
            gap /= 2
        }
    }
}

/* 插入排序（Insertion Sort） */
class InsertionSort {
    static func sort(_ nums: inout [Int]) {
        if nums.count < 2 { return }
        let len: Int = nums.count
        // 循环不变量：将 nums[i] 插入到区间 [0, i) 使之成为有序数组
        for i in 1 ..< len {
            // 先暂存这个元素，然后之前元素逐个后移，留出空位
            let cur = nums[i]
            var preIndex = i - 1
            while preIndex >= 0 && nums[preIndex] > cur {
                nums[preIndex + 1] = nums[preIndex]
                preIndex -= 1
            }
            nums[preIndex + 1] = cur
        }
    }
}

/* 选择排序（Selection Sort） */
class SelectionSort {
    static func sort(_ nums: inout [Int]) {
        if nums.count < 2 { return }
        let len: Int = nums.count
        // 循环不变量：[0, i) 有序，且该区间里所有元素就是最终排定的样子
        for i in 0 ..< (len - 1) {
            // 选择区间 [i, len - 1] 里最小的元素的索引，交换到下标 i
            var minIndex = i
            for j in (i + 1) ..< len {
                if nums[j] < nums[minIndex] {
                    minIndex = j
                }
            }
            if minIndex != i {
                nums.swapAt(i, minIndex)
            }
        }
    }
}

/* 冒泡排序（Bubble Sort） */
class BubbleSort {
    static func sort(_ nums: inout [Int]) {
        if nums.count < 2 { return }
        let len: Int = nums.count
        for i in 1 ..< len {
            var flag = true
            for j in 0 ..< (len - i) {
                if nums[j] > nums[j + 1] {
                    nums.swapAt(j, j + 1)
                    flag = false
                }
            }
            if flag {
                break
            }
        }
    }
}
