using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using System;

[ExecuteInEditMode]
public class Node : MonoBehaviour
{
    [SerializeField]
    private HashSet<Node> adjacent = new HashSet<Node>();

    public void SetEdgeTo(Node node)
    {
        adjacent.Add(node);
    }

    public bool HasEdgeTo(Node node) {
        return adjacent.Contains(node);
    }

    public void UnsetEdgeTo(Node node) {
        adjacent.Remove(node);
    }

    public IReadOnlyCollection<Node> Adjacent()
    {
        return adjacent;
    }

    public IReadOnlyCollection<Node> AdjacentComingFrom(Node other) {
        if (other == this) {
            return Adjacent();
        } else if (!adjacent.Contains(other)) {
            return new List<Node>();
        } else {
            return Adjacent().Where(node => node != other).ToArray();
        }
    }
}

