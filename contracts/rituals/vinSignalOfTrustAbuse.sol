// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title vinSignalOfTrustAbuse.sol
/// @notice Emits signals when trusted system components are abused
contract vinSignalOfTrustAbuse {
    event TrustAbuseSignal(
        address indexed reporter,
        string abusedComponent,
        string methodUsed,
        string context,
        uint256 timestamp
    );

    mapping(bytes32 => bool) public abuseRegistry;

    /// @notice Report a trust abuse incident
    /// @param abusedComponent Name of the abused system (e.g., "BitLocker COM")
    /// @param methodUsed Technique used (e.g., "CLSID Hijack via WMI")
    /// @param context Additional context (e.g., "Executed as Interactive User")
    function reportAbuse(
        string memory abusedComponent,
        string memory methodUsed,
        string memory context
    ) external {
        bytes32 abuseHash = keccak256(abi.encodePacked(abusedComponent, methodUsed, context));
        require(!abuseRegistry[abuseHash], "Already reported");

        abuseRegistry[abuseHash] = true;

        emit TrustAbuseSignal(
            msg.sender,
            abusedComponent,
            methodUsed,
            context,
            block.timestamp
        );
    }

    /// @notice Check if a specific abuse pattern has been reported
    function isReported(
        string memory abusedComponent,
        string memory methodUsed,
        string memory context
    ) external view returns (bool) {
        bytes32 abuseHash = keccak256(abi.encodePacked(abusedComponent, methodUsed, context));
        return abuseRegistry[abuseHash];
    }
}
