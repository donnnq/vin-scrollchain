contract vinRetroPurgeSignal {
    event PurgeLogged(address recipient, uint256 amount, string reason);
    event GestureCanceled(string region, string action);

    address public scrolllord = msg.sender;

    modifier onlyScrolllord() {
        require(msg.sender == scrolllord, "Scrolllord access only.");
        _;
    }

    function logPurge(address recipient, uint256 amount, string calldata reason) external onlyScrolllord {
        emit PurgeLogged(recipient, amount, reason);
    }

    function cancelGesture(string calldata region, string calldata action) external onlyScrolllord {
        emit GestureCanceled(region, action);
    }
}
