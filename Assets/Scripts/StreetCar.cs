using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StreetCar : MonoBehaviour, INavable
{

    public List<Node> loop;
    private int index;

    void Start()
    {
        index = 1;
    }

    public Node NextDestination(Node last, Node curr)
    {
        index += 1;
        index = index % loop.Count;
        return loop[index];
    }

    /*
    * need to set box collider AND rigidbody
    * set tag to which has box collider and rigidbody
    * remember to check IS KINEMATIC, uncheck USE GRAVITY, and check IS TRIGGER for them
    */
    void OnTriggerEnter(Collider collision)
    {
        if (collision.gameObject.tag == "Player" && !collision.gameObject.GetComponent<Controls.Player>().isSuperPlayer)
        {
            int currLife = collision.gameObject.GetComponent<Controls.Player>().lifeCount;
            ScoreManager.Instance.UpdatePlayerLife(currLife - 1);
        }
    }
}
