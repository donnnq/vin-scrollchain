// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinSigilSanctum.sol
/// @notice Sanctifies and indexes civic sigils into thematic constellations.

contract vinSigilSanctum {
    address public sanctumKeeper;

    struct SigilConstellation {
        string name;
        string theme;
        uint256[] sigilIndices;
        uint256 timestamp;
        string blessing;
    }

    SigilConstellation[] private sanctum;
    mapping(uint256 => bool) public isBlessed;

    event ConstellationFormed(
        string indexed name,
        string indexed theme,
        uint256[] sigilIndices,
        string blessing
    );

    modifier onlySanctumKeeper() {
        require(msg.sender == sanctumKeeper, "Unauthorized sanctum keeper");
        _;
    }

    constructor() {
        sanctumKeeper = msg.sender;
    }

    function formConstellation(
        string memory name,
        string memory theme,
        uint256[] memory sigilIndices,
        string memory blessing
    ) public onlySanctumKeeper {
        for (uint256 i = 0; i < sigilIndices.length; i++) {
            isBlessed[sigilIndices[i]] = true;
        }

        sanctum.push(SigilConstellation({
            name: name,
            theme: theme,
            sigilIndices: sigilIndices,
            timestamp: block.timestamp,
            blessing: blessing
        }));

        emit ConstellationFormed(name, theme, sigilIndices, blessing);
    }

    function viewConstellation(uint256 index) public view returns (SigilConstellation memory) {
        require(index < sanctum.length, "Sanctum index out of bounds");
        return sanctum[index];
    }

    function sanctumLength() public view returns (uint256) {
        return sanctum.length;
    }
}
