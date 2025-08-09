// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title GlobalPermit - Grants universal import/export freedom across all regions and commodities
/// @author Vinvin
/// @notice Issues ritual-grade permission for unrestricted global trade

contract GlobalPermit {
    address public scrollsmith;

    struct Permit {
        string originCountry;
        string destinationCountry;
        string commodity;
        bool isGranted;
        uint256 timestamp;
    }

    Permit[] public permits;

    event PermitGranted(string originCountry, string destinationCountry, string commodity, uint256 timestamp);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Grant universal import/export permit
    function grantPermit(
        string calldata originCountry,
        string calldata destinationCountry,
        string calldata commodity
    ) external onlyScrollsmith {
        permits.push(Permit(originCountry, destinationCountry, commodity, true, block.timestamp));
        emit PermitGranted(originCountry, destinationCountry, commodity, block.timestamp);
    }

    /// @notice View all granted permits
    function getAllPermits() external view returns (Permit[] memory) {
        return permits;
    }
}
