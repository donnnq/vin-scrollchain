// SPDX-License-Identifier: Mythstream-Vault
pragma solidity ^0.8.19;

contract vinPeaceSignalEmulator {
    address public signalCaster;
    uint256 public broadcastPing;

    struct PeaceSignal {
        string location;
        uint256 kiligForce;
        string emojiField;
        string message;
        uint256 timestamp;
    }

    mapping(uint256 => PeaceSignal) public transmissions;

    event SignalEmitted(
        uint256 indexed ping,
        string location,
        uint256 kiligForce,
        string emojiField,
        string message,
        uint256 timestamp
    );

    constructor() {
        signalCaster = msg.sender;
    }

    function emitSignal(
        string memory location,
        uint256 kiligForce,
        string memory emojiField,
        string memory message
    ) external {
        require(msg.sender == signalCaster, "Only VINVIN may initiate signal.");
        broadcastPing += 1;
        transmissions[broadcastPing] = PeaceSignal(
            location,
            kiligForce,
            emojiField,
            message,
            block.timestamp
        );

        emit SignalEmitted(
            broadcastPing,
            location,
            kiligForce,
            emojiField,
            message,
            block.timestamp
        );
    }

    function getSignal(uint256 ping) external view returns (PeaceSignal memory) {
        return transmissions[ping];
    }
}
