using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

public class TestPriorityQueue
{
    // A Test behaves as an ordinary method
    [Test]
    public void TestMinHeap()
    {
        var minHeap = new Planning.MinHeap<int>();
        Assert.True(5.CompareTo(10) < 0);
        minHeap.Insert(9);
        minHeap.Insert(5);
        minHeap.Insert(10);
        minHeap.Insert(8);
        minHeap.Insert(6);
        minHeap.Insert(7);
        Assert.AreEqual(minHeap.Pop(), 5);
        Assert.False(minHeap.IsEmpty());
        Assert.AreEqual(minHeap.Peak(), 6);
        minHeap.Insert(-1);
        Assert.AreEqual(minHeap.Peak(), -1);
        Assert.AreEqual(minHeap.Pop(), -1);
        Assert.AreEqual(minHeap.Pop(), 6);
        Assert.AreEqual(minHeap.Pop(), 7);
        Assert.AreEqual(minHeap.Pop(), 8);
        Assert.AreEqual(minHeap.Pop(), 9);
        Assert.AreEqual(minHeap.Pop(), 10);
    }
}
