// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinDisputeSanctionProtocol
/// @notice Vault-based enforcer of scrollkeeper peace. Detects and penalizes attempts to stir conflict.
contract vinDisputeSanctionProtocol {
    address public immutable scrollkeeper;
    mapping(address => bool) public peaceWhitelist;
    mapping(address => uint256) public violationCount;
    uint256 public constant maxWarnings = 2;
    event WarningIssued(address indexed offender, uint256 count);
    event SanctionTriggered(address indexed offender, string reason);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not the scrollkeeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Whitelist peaceful agents
    function markAsPeaceful(address agent) external onlyScrollkeeper {
        peaceWhitelist[agent] = true;
    }

    /// @notice Detect hostile behavior (manual trigger)
    /// @param offender The address of the individual stirring conflict
    function flagHostility(address offender) external onlyScrollkeeper {
        require(!peaceWhitelist[offender], "Peaceful agent exempt");
        violationCount[offender] += 1;

        if (violationCount[offender] <= maxWarnings) {
            emit WarningIssued(offender, violationCount[offender]);
        } else {
            emit SanctionTriggered(offender, "Exceeded peaceful conduct threshold");
            _applySanction(offender);
        }
    }

    /// @notice Internal penalty logic (can be expanded)
    function _applySanction(address offender) internal {
        // Example: apply stake burn, reputation mark, or freeze
        // For now, we just emit the sanction event
        // Future upgrade: slashing stake or disabling wallet privileges
    }
}
