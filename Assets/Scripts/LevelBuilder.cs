using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine;

public class LevelBuilder : MonoBehaviour
{
    [System.Serializable]
    public class Coordinates
    {
        [SerializeField]
        int _x;
        [SerializeField]
        int _y;

        public int x
        {
            get => _x;
        }

        public int y
        {
            get => _y;
        }

        public Coordinates(int x, int y)
        {
            this._x = x;
            this._y = y;
        }

        public override bool Equals(object obj)
        {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }

            Coordinates other = (Coordinates)obj;
            return x == other.x && y == other.y;
        }

        public override int GetHashCode()
        {
            return x ^ y;
        }
    }

    public Coordinates gridSize;

    public List<Coordinates> nodesLocations;

    public GameObject nodeSegmentPrefab;
    public GameObject emptySegmentPrefab;

    public void LoadLevel()
    {
        GameObject nodeSegment = GameObject.Find("NodeSegment");
        if (nodeSegment == null)
        {
            nodeSegment = new GameObject("NodeSegment");
        }
        nodeSegment.transform.parent = transform;
        nodeSegment.tag = "LevelSegment";
        // Create a grid of nodes
        for (int x = 0; x < gridSize.x; x++)
        {
            for (int y = 0; y < gridSize.y; y++)
            {
                if (nodesLocations.Contains(new Coordinates(x, y)))
                {
                    GameObject createdNode = Instantiate(nodeSegmentPrefab, new Vector3(x, 0, y) * 10, Quaternion.identity); // TODO: Remove hard coded 10
                    createdNode.name = "Node " + x + " " + y;
                    createdNode.transform.parent = nodeSegment.transform;
                }
            }
        }
    }

    public void FillInEmptySegments()
    {
        List<List<GameObject>> segments = new List<List<GameObject>>();
        for (int x = 0; x < gridSize.x; x++)
        {
            segments.Add(new List<GameObject>());
            for (int y = 0; y < gridSize.y; y++)
            {
                segments[x].Add(null);
            }
        }
        GameObject[] levelSegments = GameObject.FindGameObjectsWithTag("LevelSegment");
        foreach (GameObject segment in levelSegments)
        {
            if (segment.name == "NodeSegment")
            {
                continue;
            }
            int x = (int)Math.Round(segment.transform.position.x / 10);
            int y = (int)Math.Round(segment.transform.position.z / 10);
            segments[x][y] = segment;
        }
        GameObject emptySegment = GameObject.Find("EmptySegment");
        if (emptySegment == null)
        {
            emptySegment = new GameObject("EmptySegment");
        }
        emptySegment.transform.parent = transform;
        emptySegment.tag = "LevelSegment";

        for (int x = 0; x < gridSize.x; x++)
        {
            for (int y = 0; y < gridSize.y; y++)
            {
                if (segments[x][y] == null)
                {
                    GameObject createdNode = Instantiate(emptySegmentPrefab, new Vector3(x, 0, y) * 10, Quaternion.identity);
                    createdNode.transform.parent = emptySegment.transform;
                }
            }
        }
    }

    public void ClearMap()
    {
        Debug.Log("Destroying clones");
        foreach (GameObject segment in GameObject.FindGameObjectsWithTag("LevelSegment"))
        {
            DestroyImmediate(segment);
        }
    }
}



