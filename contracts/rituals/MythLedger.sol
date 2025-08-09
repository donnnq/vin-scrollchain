// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGlyphReward {
    function getGlyphBalance(address contributor) external view returns (uint256);
}

interface IUnifiedResolve {
    function problems(bytes32 problemId) external view returns (
        string memory description,
        string memory location,
        address initiator,
        bool resolved,
        address[] memory contributors,
        address[] memory recruits
    );
}

contract MythLedger {
    IGlyphReward public glyphReward;
    IUnifiedResolve public unifiedResolve;

    struct Legend {
        address contributor;
        uint256 glyphs;
        bytes32[] problemIds;
    }

    mapping(address => Legend) public legends;
    address[] public allLegends;

    event LegendUpdated(address indexed contributor, uint256 glyphs);

    constructor(address _glyphReward, address _unifiedResolve) {
        glyphReward = IGlyphReward(_glyphReward);
        unifiedResolve = IUnifiedResolve(_unifiedResolve);
    }

    function updateLegend(bytes32 problemId) external {
        (, , , bool resolved, address[] memory contributors, ) = unifiedResolve.problems(problemId);
        require(resolved, "Problem not resolved");

        for (uint256 i = 0; i < contributors.length; i++) {
            address contributor = contributors[i];
            uint256 glyphs = glyphReward.getGlyphBalance(contributor);

            if (legends[contributor].contributor == address(0)) {
                legends[contributor].contributor = contributor;
                allLegends.push(contributor);
            }

            legends[contributor].glyphs = glyphs;
            legends[contributor].problemIds.push(problemId);

            emit LegendUpdated(contributor, glyphs);
        }
    }

    function getLegend(address contributor) external view returns (Legend memory) {
        return legends[contributor];
    }

    function getAllLegends() external view returns (address[] memory) {
        return allLegends;
    }
}
