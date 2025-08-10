// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ImmunityNullifier - Ritual scroll to revoke immunity from leaders who breach civic trust
/// @author Vinvin
/// @notice Removes symbolic and legal shields from any actor encoded in the scrollchain

contract ImmunityNullifier {
    address public scrollsmith;

    struct NullifiedFigure {
        string name;
        string country;
        string reason;
        bool isNullified;
        uint256 timestamp;
    }

    NullifiedFigure[] public nullified;

    event ImmunityRevoked(string name, string country, string reason, uint256 timestamp);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Revoke immunity from a leader
    function revokeImmunity(string calldata name, string calldata country, string calldata reason) external onlyScrollsmith {
        nullified.push(NullifiedFigure(name, country, reason, true, block.timestamp));
        emit ImmunityRevoked(name, country, reason, block.timestamp);
    }

    /// @notice View all nullified figures
    function getAllNullified() external view returns (NullifiedFigure[] memory) {
        return nullified;
    }
}
