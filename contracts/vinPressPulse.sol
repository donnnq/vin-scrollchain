// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinPressPulse {
    string public creed = "Truth must circulate. Journalism is a civic ritual.";
    address public keeper;

    event SignalBroadcasted(string headline, bool verified);
    event ProtectionRequested(address journalist, string reason);
    event FreedomPulse(string region, string status);

    modifier onlyKeeper() {
        require(msg.sender == keeper, "Unauthorized signal attempt.");
        _;
    }

    constructor() {
        keeper = msg.sender;
    }

    function broadcastTruth(string memory headline, bool verified) public onlyKeeper {
        emit SignalBroadcasted(headline, verified);
    }

    function requestProtection(string memory reason) public {
        emit ProtectionRequested(msg.sender, reason);
    }

    function pulseStatus(string memory region, string memory status) public onlyKeeper {
        emit FreedomPulse(region, status);
    }

    function pressCreed() public pure returns (string memory) {
        return "No institution shall mute the scroll. Truth has its own bandwidth.";
    }
}
