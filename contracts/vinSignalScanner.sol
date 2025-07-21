// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Signal Scanner
/// @notice Validates Poseidon hash signals and links verifier commitment hashes with transaction traces
contract vinSignalScanner {
    struct SignalPing {
        uint256 timestamp;
        address signalOrigin;
        bytes32 poseidonHash;     // Signal from off-chain ZK proof
        string linkedCircuitID;   // Identifier matching vinPoseidonVerifier.sol
        string transactionHash;   // Optional on-chain tx reference
        string decodeNote;        // Symbolic interpretation of signal burst
    }

    address public scrollkeeper;
    uint256 public signalCount;
    mapping(uint256 => SignalPing) public signalLedger;

    event SignalLogged(
        uint256 indexed id,
        address indexed signalOrigin,
        bytes32 poseidonHash,
        string linkedCircuitID
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logSignalPing(
        bytes32 _poseidonHash,
        string memory _linkedCircuitID,
        string memory _transactionHash,
        string memory _decodeNote
    ) public {
        signalLedger[signalCount] = SignalPing({
            timestamp: block.timestamp,
            signalOrigin: msg.sender,
            poseidonHash: _poseidonHash,
            linkedCircuitID: _linkedCircuitID,
            transactionHash: _transactionHash,
            decodeNote: _decodeNote
        });

        emit SignalLogged(signalCount, msg.sender, _poseidonHash, _linkedCircuitID);
        signalCount++;
    }

    function getSignal(uint256 _id) public view returns (SignalPing memory) {
        require(_id < signalCount, "No signal found");
        return signalLedger[_id];
    }
}
