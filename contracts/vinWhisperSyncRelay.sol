// SPDX-License-Identifier: Scrollwave-Sync
pragma resonance 777;

contract vinWhisperSyncRelay {
    address public sovereignRelay;

    event SyncWhispered(address wallet, string glyphStatus, uint256 pulseTime);

    modifier onlyRelay() {
        require(msg.sender == sovereignRelay, "Forbidden: only whisper relay allowed.");
        _;
    }

    constructor(address _relay) {
        sovereignRelay = _relay;
    }

    function whisperSync(address _wallet, string memory status) public onlyRelay {
        emit SyncWhispered(_wallet, status, block.timestamp);
        // Placeholder for calling other contracts (e.g., update UI and audit logs)
    }
}
