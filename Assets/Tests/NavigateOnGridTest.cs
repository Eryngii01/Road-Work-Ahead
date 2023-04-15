using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;


public class NavigateOnGridTest
{

    private static MockNavable mockNavable;

    private static NavigateOnNetwork navigateOnNetwork;

    private static Node westNode;
    private static Node eastNode;

    public class MockNavable : MonoBehaviour, INavable {
        public Node NextDestination(Node last, Node curr) {
            return westNode;
        }
    }

    [SetUp]
    public void Setup() {
        // Set up the nodes east and west.
        var testObject = new GameObject();
        var westNodeObject = GameObject.Instantiate(
            testObject,
            new Vector3(0f, 0f, 0f), 
            Quaternion.identity);
        westNode = westNodeObject.AddComponent<Node>();

        var eastNodeObject = GameObject.Instantiate(
            testObject,
            new Vector3(1f, 0f, 0f),
            Quaternion.identity);
        eastNode = eastNodeObject.AddComponent<Node>();

        eastNode.SetEdgeTo(westNode);
        westNode.SetEdgeTo(eastNode);

        // Set up our navigator to navigate along them at a speed of 0.01 which
        // should take 100 seconds
        var testNavigator = GameObject.Instantiate(testObject);
        testNavigator.AddComponent<MockNavable>();
        navigateOnNetwork = testNavigator.AddComponent<NavigateOnNetwork>();
        navigateOnNetwork.spawn = eastNode;
        navigateOnNetwork.speed = 1f;
    }

    public void AssertVectorsClose(Vector3 a, Vector3 b) 
    {
        Assert.True(Vector3.Distance(a, b) < 1e-1f);
    }

    public void AssertVectorsNotClose(Vector3 a, Vector3 b) 
    {
        Assert.False(Vector3.Distance(a, b) < 1e-1f);
    }



    [UnityTest]
    public IEnumerator NavigateOnGridTestWithEnumeratorPasses()
    {
        // We should start at the east Node
        Assert.AreEqual(navigateOnNetwork.spawn, eastNode);
        AssertVectorsClose(navigateOnNetwork.transform.position, eastNode.transform.position);
        Assert.NotNull(navigateOnNetwork.from);
        Assert.NotNull(navigateOnNetwork.to);
        yield return new WaitForSeconds(0.5f);
        // After 50 seconds we should still be in transit and
        //  not have arrived at the west node yet 
        Assert.AreEqual(navigateOnNetwork.from, eastNode);
        Assert.AreEqual(navigateOnNetwork.to, westNode);
        AssertVectorsNotClose(navigateOnNetwork.transform.position, eastNode.transform.position);
        AssertVectorsNotClose(navigateOnNetwork.transform.position, westNode.transform.position);
        yield return new WaitForSeconds(0.5f);
        // After the full 100 seconds we should arrive at the west node.
        AssertVectorsClose(navigateOnNetwork.transform.position, westNode.transform.position);
        yield return new WaitForSeconds(0.1f);
        // And then we should stay there.
        Assert.AreEqual(navigateOnNetwork.to, westNode);
        Assert.AreEqual(navigateOnNetwork.from, westNode);
        AssertVectorsClose(navigateOnNetwork.transform.position, westNode.transform.position);
    }
}
