/**
 * Definition for singly-linked list.
  function ListNode(val) {
      this.val = val;
      this.next = null;
  }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
  len1 = 0
  len2 = 0
  nodeA = headA
  nodeB = headB

  if (!nodeA || !nodeB) {
    return null
  }

  while(nodeA) {
    nodeA = nodeA.next
    len1 ++;
  }
  
  while (nodeB) {
    nodeB = nodeB.next
    len2 ++;
  }
  
  if (len1 > len2) {
    diff = len1 - len2;
    for (i = 0; i < (diff - 1); i++) {
      nodeA = nodeA.next
    }
  } else {
    diff = len2 - len1;
    for (i = 0; i < (diff - 1); i++) {
      nodeB = nodeB.next
    }
  }

  while (nodeA != nodeB) {
    nodeA = nodeA.next
    nodeB = nodeB.next
  }

  return nodeA

};
