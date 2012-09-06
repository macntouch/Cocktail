<?php

interface lib_hxtml_IStyleProxy {
	function setZIndex($element, $value);
	function setOverflowY($element, $value);
	function setOverflowX($element, $value);
	function setWhiteSpace($element, $value);
	function setVerticalAlignKey($element, $value);
	function setVerticalAlignNum($element, $value, $unit);
	function setTextAlign($element, $value);
	function setWordSpacingKey($element, $value);
	function setWordSpacingNum($element, $value, $unit);
	function setLetterSpacingKey($element, $value);
	function setLetterSpacingNum($element, $value, $unit);
	function setTextIndent($element, $value, $unit);
	function setTextTransform($element, $value);
	function setLineHeightKey($element, $value);
	function setLineHeightZero($element);
	function setLineHeightNum($element, $value, $unit);
	function setTextDecoration($element, $value);
	function setTextColorRGB($element, $value);
	function setTextColorRGBA($element, $value);
	function setTextColorNum($element, $value);
	function setTextColorKey($element, $value);
	function setFontVariant($element, $value);
	function setFontFamily($element, $value);
	function setFontStyle($element, $value);
	function setFontWeightNum($element, $value);
	function setFontWeightKey($element, $value);
	function setFontSizeKey($element, $value);
	function setFontSizeNum($element, $value, $unit);
	function setBgPos($element, $value);
	function setBgRepeat($element, $value);
	function setBgAttachment($element, $value);
	function setBgImage($element, $value);
	function setBgColorKey($element, $value);
	function setBgColorRGB($element, $value);
	function setBgColorRGBA($element, $value);
	function setBgColorHex($element, $value);
	function setRightKey($element, $value);
	function setBottomKey($element, $value);
	function setLeftKey($element, $value);
	function setTopKey($element, $value);
	function setRightZero($element);
	function setRight($element, $value, $unit);
	function setBottomZero($element);
	function setBottom($element, $value, $unit);
	function setLeftZero($element);
	function setLeft($element, $value, $unit);
	function setTopZero($element);
	function setTop($element, $value, $unit);
	function setHeightKey($element, $value);
	function setHeightZero($element);
	function setHeight($element, $value, $unit);
	function setWidthKey($element, $value);
	function setWidthZero($element);
	function setWidth($element, $value, $unit);
	function setMaxHeightZero($element);
	function setMaxHeightKey($element, $value);
	function setMaxHeight($element, $value, $unit);
	function setMinHeightZero($element);
	function setMinHeight($element, $value, $unit);
	function setMaxWidthKey($element, $value);
	function setMaxWidthZero($element);
	function setMaxWidth($element, $value, $unit);
	function setMinWidthZero($element);
	function setMinWidth($element, $value, $unit);
	function setPaddingBottom($element, $value, $unit);
	function setPaddingRight($element, $value, $unit);
	function setPaddingTop($element, $value, $unit);
	function setPaddingLeft($element, $value, $unit);
	function setMarginRightZero($element);
	function setMarginLeftZero($element);
	function setMarginTopZero($element);
	function setMarginBottomZero($element);
	function setMarginBottomKey($element, $value);
	function setMarginBottomNum($element, $value, $unit);
	function setMarginRightKey($element, $value);
	function setMarginRightNum($element, $value, $unit);
	function setMarginTopKey($element, $value);
	function setMarginTopNum($element, $value, $unit);
	function setMarginLeftKey($element, $value);
	function setMarginLeftNum($element, $value, $unit);
	function setTransitionDelay($element, $value);
	function setTransitionTimingFunction($element, $value);
	function setTransitionDuration($element, $value);
	function setTransitionProperty($element, $value);
	function setTransform($element, $value);
	function setTransformOrigin($element, $value);
	function setClear($element, $value);
	function setCssFloat($element, $value);
	function setPosition($element, $value);
	function setDisplay($element, $value);
}
