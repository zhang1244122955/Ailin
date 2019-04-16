
package com.zz624.matchbean;

import java.util.List;

public class Result {

	private double score;
	private List<Face_list> face_list;

	public void setScore(double score) {
		this.score = score;
	}

	public double getScore() {
		return score;
	}

	public void setFace_list(List<Face_list> face_list) {
		this.face_list = face_list;
	}

	public List<Face_list> getFace_list() {
		return face_list;
	}

	@Override
	public String toString() {
		return "Result{" +
				"score=" + score +
				", face_list=" + face_list +
				'}';
	}
}