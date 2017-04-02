package com.xm.base.enums;
import static com.xm.base.enums.Outcome.*;
/**
 * 进行分发处理
 *  还可以使用二维数组进行分发
 * Created by xm on 2017/3/23.
 */


public enum RoShamBo implements Competitor<RoShamBo>{
    PAPER(DRAW,LOSE,WIN),
    SCISSORS(WIN,DRAW,LOSE),
    ROCK(LOSE,WIN,DRAW);

    private Outcome vPaper,vScissors,vRock;

    private RoShamBo(Outcome vPaper,Outcome vScissors,Outcome vRock){
        this.vPaper=vPaper;
        this.vScissors=vScissors;
        this.vRock=vRock;
    }

    @Override
    public Outcome compete(RoShamBo rb) {
        switch(rb){
            case PAPER:return vPaper;
            case SCISSORS:return vScissors;
            case ROCK:return vRock;
        }
        return null;
    }


    public static void main(String args[]) {
        System.out.println(RoShamBo.PAPER.compete(RoShamBo.ROCK));
    }
}
