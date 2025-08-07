// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title vinSignalSanctifier.sol
/// @notice Verifies authenticity of trust abuse reports
contract vinSignalSanctifier {
    mapping(address => bool) public trustedReporters;
    mapping(bytes32 => bool) public verifiedSignals;

    event ReporterSanctified(address reporter);
    event SignalVerified(bytes32 abuseHash, address verifier);

    /// @notice Add a trusted reporter
    function sanctifyReporter(address reporter) external {
        trustedReporters[reporter] = true;
        emit ReporterSanctified(reporter);
    }

    /// @notice Verify a reported abuse signal
    function verifySignal(
        string memory abusedComponent,
        string memory methodUsed,
        string memory context
    ) external {
        require(trustedReporters[msg.sender], "Not sanctified");

        bytes32 abuseHash = keccak256(abi.encodePacked(abusedComponent, methodUsed, context));
        verifiedSignals[abuseHash] = true;

        emit SignalVerified(abuseHash, msg.sender);
    }

    /// @notice Check if a signal is verified
    function isVerified(bytes32 abuseHash) external view returns (bool) {
        return verifiedSignals[abuseHash];
    }
}
