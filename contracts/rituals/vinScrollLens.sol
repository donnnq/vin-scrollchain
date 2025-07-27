// SPDX-License-Identifier: Ripple-Insight-2025
pragma solidity ^0.8.21;

contract vinScrollLens {
    address public scrollkeeper;

    struct RippleEvent {
        bytes32 fileHash;
        uint256 timestamp;
        string auraImpact;
        address observer;
    }

    mapping(bytes32 => RippleEvent[]) public rippleLogs;

    event RippleTraced(bytes32 indexed fileHash, string auraImpact, address indexed observer);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Unauthorized lens wielder");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function traceRipple(bytes32 fileHash, string calldata auraImpact) external {
        RippleEvent memory ripple = RippleEvent({
            fileHash: fileHash,
            timestamp: block.timestamp,
            auraImpact: auraImpact,
            observer: msg.sender
        });

        rippleLogs[fileHash].push(ripple);
        emit RippleTraced(fileHash, auraImpact, msg.sender);
    }

    function getRipples(bytes32 fileHash) external view returns (RippleEvent[] memory) {
        return rippleLogs[fileHash];
    }
}
