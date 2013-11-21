package util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * 树形类
 * @author Chen
 *
 */
public class Tree {
	private Map<Integer, Object> data = new HashMap<Integer, Object>();
	private Map<Integer, List<Integer>> child = new HashMap<Integer, List<Integer>>();
	private Map<Integer, Integer> parent = new HashMap<Integer, Integer>();
	private Map<Integer, Integer> layer = new HashMap<Integer, Integer>();
	private List<Object> tree = new ArrayList<Object>();
	private int curId;
	
	
	public List<Object> getTree() {
		return tree;
	}

	public void setTree(List<Object> tree) {
		this.tree = tree;
	}

	public void setNode(int id,int pid ,Object value){
		data.put(id, value);
		parent.put(id, pid);
		if(!child.containsKey(pid)){
			List<Integer> cid = new ArrayList<Integer>();
			cid.add(id);
			child.put(pid, cid);
		}else{
			child.get(pid).add(id);
		}
	}
	
	//重新排序列表，并保存到tree里
	public void getList(int id){
		if(child.get(id)!=null){
			Iterator it = child.get(id).iterator();
			while(it.hasNext()){
				int currenId = (Integer) it.next();
				tree.add(data.get(currenId));
				//如果仍是list，递归
				if(child.get(currenId) instanceof List<?>){
					getList(currenId);
				}
			}
		}		
	}
	public void reSetLayer(int id){	
		if(parent.get(id)!=0){
			layer.put(curId, layer.get(curId) + 1);
			reSetLayer(parent.get(id));
		}
	}
	public int getLayer(int id){
		curId = id;
		layer.put(id, 0);
		reSetLayer(id);
		return layer.get(id);
	}
	
}
