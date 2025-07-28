contract vinEmbassySync {
    struct SyncEvent {
        string embassy;
        string purpose;
        uint256 timestamp;
    }

    mapping(address => SyncEvent[]) public syncLogs;

    event EmbassyInteraction(address indexed subject, string embassy, string purpose, uint256 timestamp);

    function logEvent(address subject, string memory embassy, string memory purpose) public {
        syncLogs[subject].push(SyncEvent(embassy, purpose, block.timestamp));
        emit EmbassyInteraction(subject, embassy, purpose, block.timestamp);
    }
}
