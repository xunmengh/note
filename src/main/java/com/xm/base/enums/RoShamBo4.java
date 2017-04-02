package com.xm.base.enums;
import static com.xm.base.enums.Outcome.*;

/**
 * Created by xm on 2017/3/23.
 */
public enum RoShamBo4 implements Competitor<RoShamBo4>{
    PAPER{
        @Override
        public Outcome compete(RoShamBo4 rb) {
            switch (rb){
                default:
                case PAPER: return DRAW;
                case SCISSORS: return LOSE;
                case ROCK : return WIN;
            }
        }
    },
    SCISSORS{
        @Override
        public Outcome compete(RoShamBo4 rb) {
            switch (rb){
                default:
                case PAPER: return WIN;
                case SCISSORS: return DRAW;
                case ROCK : return LOSE;
            }
        }
    },
    ROCK{
        @Override
        public Outcome compete(RoShamBo4 rb) {
            switch (rb){
                default:
                case PAPER: return LOSE;
                case SCISSORS: return WIN;
                case ROCK : return DRAW;
            }
        }
    };

    public abstract Outcome compete(RoShamBo4 rb);

    public static void main(String args[]) {
        System.out.println(RoShamBo.PAPER.compete(RoShamBo.ROCK));
    }
}
