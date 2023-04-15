using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SuperPlayer : Item
{
    public GameObject timer = null;
    public GameObject timerPrefab = null;
    public int durationTimer = 10;
    private void Awake()
    {
        gameObject.tag = "Item";
    }

    public override void Deploy(Node node)
    {
        gameObject.SetActive(true);
        gameObject.transform.position = new Vector3(0, 100, 0);
        timer = Instantiate(timerPrefab, holder.transform.position + new Vector3(0, 1, 0), Quaternion.identity);
        timer.transform.SetParent(transform);
        StartCoroutine(BecomeSuper());
        dropped = true;
    }

    private void Update()
    {
        if (timer != null)
        {
            timer.transform.position = holder.transform.position + new Vector3(0, 1, 0);
        }
        if (!dropped && holder == null)
        {
            preDropAnimation();
        }
    }


    private IEnumerator BecomeSuper()
    {
        holder.GetComponent<Controls.Player>().isSuperPlayer = true;
        holder.GetComponent<NavigateOnNetwork>().speedMultiplier = 1.5f;
        holder.transform.localScale = new Vector3(2f, 2f, 2f);
        ScoreManager.Instance.InvokeSuperPlayer();
        
        for (int i = 0; i < durationTimer; i++)
        {
            timer.GetComponent<TextMesh>().text = (durationTimer - i).ToString();
            yield return new WaitForSeconds(1);
        }
        Destroy(gameObject);
    }

    private void OnDestroy()
    {
        if (holder != null)
        {
            holder.GetComponent<Controls.Player>().isSuperPlayer = false;
            holder.GetComponent<NavigateOnNetwork>().speedMultiplier = 1;
            holder.transform.localScale = new Vector3(1f, 1f, 1f);
            holder = null;
            ScoreManager.Instance.UndoSuperPlayer();
        }

    }
    public override void preDropAnimation()
    {
        // Minimize and spin the item
        transform.localScale = new Vector3(4f, 4f, 4f);
        transform.Rotate(new Vector3(0, 1, 0), 0.2f);
    }

    public override void InteractWithEnemy(GameObject enemy)
    {
        return;
    }
}
