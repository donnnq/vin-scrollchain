// A healing scroll for communities hit by addiction.
contract vinKarmaDetoxScroll {
    mapping(address => bool) public healers;
    event DetoxInvoked(address indexed healer, string method);

    function registerHealer(address _healer) external {
        healers[_healer] = true;
    }

    function invokeDetox(string calldata method) external {
        require(healers[msg.sender], "Unrecognized healer.");
        emit DetoxInvoked(msg.sender, method);
    }
}
