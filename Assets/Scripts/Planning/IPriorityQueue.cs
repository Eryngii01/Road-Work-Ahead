using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Planning
{
    public interface IPriorityQueue<T> where T : IComparable<T> 
    {
        public void Insert(T value);
        public T Peak();
        public T Pop();
        public bool IsEmpty();
        public void Clear();
    }


    public class MinHeap<T> : IPriorityQueue<T> where T : IComparable<T> 
    {
        private List<T> heap;

        public MinHeap() 
        {
            heap = new List<T>();
        }

        private int Parent(int idx) {
            return (idx - 1) >> 1;
        }

        private int Left(int idx) {
            return (idx << 1) + 1;
        }

        private int Right(int idx) {
            return (idx << 1) + 2;
        }

        private void MinHeapify(int at)
        {
            int idx = at;
            int left;
            int right;
            int smallest;
            while (true) {
                left = Left(idx);
                right = Right(idx);
                if (left < heap.Count && heap[left].CompareTo(heap[idx]) < 0) {
                    // heap[Left] < heap[idx]
                    smallest = left;
                } else {
                    smallest = idx;
                }

                if (right < heap.Count && heap[right].CompareTo(heap[smallest]) < 0) {
                    smallest = right;
                }

                if (idx == smallest) {
                    break;
                }

                (heap[idx], heap[smallest]) = (heap[smallest], heap[idx]);
                idx = smallest;
            }
        }

        public void Insert(T value) 
        {

            heap.Add(value);
            // Decrease key of the last element
            int idx = heap.Count - 1;
            int parent = Parent(idx);
            while (idx > 0 && heap[idx].CompareTo(heap[parent]) < 0) {
                (heap[parent], heap[idx]) = (heap[idx], heap[parent]);
                idx = parent;
                parent = Parent(idx);
            }
        }

        public T Peak() 
        {
            return heap[0];
        }

        public T Pop() 
        {
            T head = heap[0];
            heap[0] = heap[heap.Count - 1];
            heap.RemoveAt(heap.Count - 1);
            MinHeapify(0);
            return head;
        }

        public bool IsEmpty() 
        {
            return heap.Count == 0;
        }

        public void Clear() 
        {
            heap.Clear();
        }
    }
}