// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SanctumRegistry - Ledger of all ZeroTaxSanctum zones
contract SanctumRegistry {
    address public scrollsmith;
    uint256 public sanctumCount;

    struct Sanctum {
        string name;
        address sanctumAddress;
        string decree;
        bool active;
    }

    mapping(uint256 => Sanctum) public sanctums;

    event SanctumRegistered(uint256 indexed id, string name, address sanctumAddress);
    event SanctumDeactivated(uint256 indexed id, string name);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized.");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a new ZeroTaxSanctum
    function registerSanctum(string memory _name, address _sanctumAddress, string memory _decree) external onlyScrollsmith {
        sanctums[sanctumCount] = Sanctum(_name, _sanctumAddress, _decree, true);
        emit SanctumRegistered(sanctumCount, _name, _sanctumAddress);
        sanctumCount++;
    }

    /// @notice Deactivate a sanctum
    function deactivateSanctum(uint256 _id) external onlyScrollsmith {
        sanctums[_id].active = false;
        emit SanctumDeactivated(_id, sanctums[_id].name);
    }

    /// @notice Get sanctum details
    function getSanctum(uint256 _id) external view returns (Sanctum memory) {
        return sanctums[_id];
    }

    /// @notice List all active sanctums
    function listActiveSanctums() external view returns (Sanctum[] memory) {
        uint256 activeCount;
        for (uint256 i = 0; i < sanctumCount; i++) {
            if (sanctums[i].active) activeCount++;
        }

        Sanctum[] memory activeSanctums = new Sanctum[](activeCount);
        uint256 index;
        for (uint256 i = 0; i < sanctumCount; i++) {
            if (sanctums[i].active) {
                activeSanctums[index] = sanctums[i];
                index++;
            }
        }

        return activeSanctums;
    }
}
