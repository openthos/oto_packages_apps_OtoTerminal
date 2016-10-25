package jackpal.androidterm;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

/**
 * Created by wanglifeng on 16-10-12.
 */
public class TerminalViewGroup extends ViewGroup {


    public TerminalViewGroup(Context context) {
        this(context, null);
    }

    public TerminalViewGroup(Context context, AttributeSet attrs) {
        this(context, attrs,0);
    }

    public TerminalViewGroup(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override
    protected void onLayout(boolean b, int i, int i1, int i2, int i3) {
        Log.d("1542","onLayout");
        int mPainterPosX = i;
        int mPainterPosY = i1;
        View childView = getChildAt(0);
        childView.setVisibility(View.VISIBLE);
        int width  = childView.getMeasuredWidth();
        int height = childView.getMeasuredHeight();
        childView.layout(mPainterPosX, mPainterPosY,mPainterPosX+width, mPainterPosY+height);
    }

    @Override
    public LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new MarginLayoutParams(getContext(), attrs);
    }

    @Override
    protected LayoutParams generateDefaultLayoutParams() {
        return new MarginLayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
    }

    @Override
    protected LayoutParams generateLayoutParams(LayoutParams p) {
        return new MarginLayoutParams(p);
    }

    @Override
    protected boolean checkLayoutParams(LayoutParams p) {
        return p instanceof MarginLayoutParams;
    }

    @Override
    public boolean shouldDelayChildPressedState() {
        return false;
    }



}
