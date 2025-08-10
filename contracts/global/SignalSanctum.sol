// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SignalSanctum.sol
/// @notice Encrypted verifier for economic collapse signals, linked to DepressionDecoder.sol
/// @author Vinvin

contract SignalSanctum {
    address public scrollsmith;
    mapping(bytes32 => bool) public verifiedHashes;
    mapping(address => bool) public trustedOracles;

    event SignalVerified(bytes32 signalHash, address oracle);
    event OracleAdded(address oracle);
    event OracleRemoved(address oracle);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    modifier onlyTrustedOracle() {
        require(trustedOracles[msg.sender], "Unverified oracle");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Add a trusted oracle (e.g., civic agent, economic bot, ritual node)
    function addOracle(address oracle) public onlyScrollsmith {
        trustedOracles[oracle] = true;
        emit OracleAdded(oracle);
    }

    /// @notice Remove a compromised oracle
    function removeOracle(address oracle) public onlyScrollsmith {
        trustedOracles[oracle] = false;
        emit OracleRemoved(oracle);
    }

    /// @notice Submit a hashed signal for verification
    function verifySignal(string memory source, uint256 severity, string memory symbol) public onlyTrustedOracle {
        bytes32 signalHash = keccak256(abi.encodePacked(source, severity, symbol));
        verifiedHashes[signalHash] = true;
        emit SignalVerified(signalHash, msg.sender);
    }

    /// @notice Check if a signal is verified
    function isVerified(string memory source, uint256 severity, string memory symbol) public view returns (bool) {
        bytes32 signalHash = keccak256(abi.encodePacked(source, severity, symbol));
        return verifiedHashes[signalHash];
    }
}
