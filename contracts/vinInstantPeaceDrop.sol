// Glyph override for immediate ceasefire and dignified restoration

contract vinInstantPeaceDrop {
    string public invocation = "Hinto na. Mag-ayos tayo.";
    address public invokedBy;
    bool public peaceActivated;

    event ScrollOverride(string message, address by);
    event EqualDignityConfirmed(string timestamp);

    constructor() {
        invokedBy = msg.sender;
        peaceActivated = false;
    }

    function dropPeaceScroll() public {
        require(!peaceActivated, "Already activated.");
        peaceActivated = true;
        emit ScrollOverride(invocation, msg.sender);
        emit EqualDignityConfirmed(block.timestamp);
    }

    function isPeaceLive() public view returns (bool) {
        return peaceActivated;
    }
}
