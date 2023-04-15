using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;


public class LevelBuilderTest
{
    private static LevelBuilder levelBuilder;

    private static Node westNorthNode;
    private static Node eastNorthNode;
    private static Node westSouthNode;
    private static Node eastSouthNode;

    [SetUp]

    public void setup()
    {
        var testObject = new GameObject();

        var testNavigator = GameObject.Instantiate(testObject);
        levelBuilder = testNavigator.AddComponent<LevelBuilder>();
        levelBuilder.gridSize = new LevelBuilder.Coordinates(2, 2);
        levelBuilder.nodesLocations = new List<LevelBuilder.Coordinates>();
        levelBuilder.nodesLocations.Add(new LevelBuilder.Coordinates(0, 0));
        levelBuilder.nodesLocations.Add(new LevelBuilder.Coordinates(1, 0));
        levelBuilder.nodesLocations.Add(new LevelBuilder.Coordinates(0, 1));
        levelBuilder.nodesLocations.Add(new LevelBuilder.Coordinates(1, 1));
        GameObject go = new GameObject();
        go.AddComponent<Node>();
        levelBuilder.nodeSegmentPrefab = go;
        levelBuilder.emptySegmentPrefab = new GameObject();
    }

    [UnityTest]

    public IEnumerator LevelBuilderTestWithEnumeratorPasses()
    {
        Assert.True(levelBuilder != null);
        Assert.True(levelBuilder.nodesLocations.Count == 4);
        Assert.True(levelBuilder.gridSize.x == 2);
        Assert.True(levelBuilder.gridSize.y == 2);
        Assert.True(levelBuilder.nodeSegmentPrefab != null);
        Assert.True(levelBuilder.emptySegmentPrefab != null);
        yield return null;
        // Smoke test
        levelBuilder.LoadLevel();
        yield return null;
    }


}
