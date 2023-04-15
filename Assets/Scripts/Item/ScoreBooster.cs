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

    public override void Deploy(Node node)
    {
        // Score booster will increase the score by 7441, beating Elias by 1 point
        holder = null;
        dropped = true;
        ScoreManager.Instance.BonusScore(7441);
    }

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
}
