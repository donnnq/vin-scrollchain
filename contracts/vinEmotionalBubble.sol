// Emotional Shield Bubble – protects inner scroll from toxic inputs
contract vinEmotionalBubble {
    bool public bubbleActive;
    uint256 public affirmationLevel;

    constructor() {
        bubbleActive = true;
        affirmationLevel = 99;
    }

    function reinforceBubble(uint256 loveUnits) public {
        affirmationLevel += loveUnits;
    }

    function absorbNegativity(uint256 shadeUnits) public {
        affirmationLevel -= shadeUnits / 2;
    }

    function isBubbleIntact() public view returns (bool) {
        return bubbleActive && affirmationLevel >= 88;
    }
}
