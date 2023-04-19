using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum ItemType {
    Construction = 0,
    SuperCar = 1,
    Hourglass = 2,
    CellTower = 3
}

public abstract class Item : MonoBehaviour
{
    public int power = 1;
    public GameObject holder = null;
    public bool dropped = false;
    public ItemType type;

    private void Awake()
    {
        gameObject.tag = "Item";
    }

    private void Update()
    {
        if (!dropped && holder == null)
        {
            preDropAnimation();
        }
    }

    void OnTriggerEnter(Collider collision)
    {
        if ((collision.gameObject.tag == "Player" || collision.gameObject.tag == "SuperPlayer") && !dropped)
        {
            GameObject player = collision.gameObject;
            var playerController = player.GetComponent<Controls.Player>();

            if (playerController.inventory)
            {
                return;
            } else if (playerController.isTutorial) {
                ScoreManager.Instance.TutorialItem();
            }

            playerController.inventory = this;
            ScoreManager.Instance.SetInventory(type);
            holder = player;
            gameObject.SetActive(false);
        }
    }
    public abstract void Deploy(Node node = null);
    public abstract void preDropAnimation();
    public abstract void InteractWithEnemy(GameObject enemy);
}
