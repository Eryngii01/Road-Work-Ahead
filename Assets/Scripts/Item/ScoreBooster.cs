using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ScoreBooster : Item
{
    private void Awake()
    {
        gameObject.tag = "Item";
    }

    public override void Deploy(Node node) {}

    public override void preDropAnimation()
    {
        // Minimize and spin the item
        transform.localScale = new Vector3(3f, 3f, 3f);
        transform.Rotate(new Vector3(0, 1, 0), 0.2f);
    }

    public override void InteractWithEnemy(GameObject enemy)
    {
        // Score booster does not interact with enemies
        return;
    }

    // Automatically add the bonus to the score when this item is interacted with
    void OnTriggerEnter(Collider collision) {
        if ((collision.gameObject.tag == "Player" || collision.gameObject.tag == "SuperPlayer") && !dropped) {
            ScoreManager.Instance.BonusScore(500);
        }
    }
}
