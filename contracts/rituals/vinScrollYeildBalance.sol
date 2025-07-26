// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title VinScrollYieldBalance - A symbolic portfolio rebalance contract
/// @author VINVIN
contract VinScrollYieldBalance {
    address public steward;
    
    struct Scroll {
        bytes32 glyph;
        uint256 allocation; // in percent
    }

    Scroll[] public scrolls;

    event RitualDeployed(bytes32 glyph, uint256 allocation);
    event StewardChanged(address indexed oldSteward, address indexed newSteward);

    modifier onlySteward() {
        require(msg.sender == steward, "Only the steward may perform this rite.");
        _;
    }

    constructor() {
        steward = msg.sender;

        _deployRitual("ScrollOfYield", 60);
        _deployRitual("ScrollOfGrowth", 30);
        _deployRitual("ScrollOfSymbolicLegacy", 10);
    }

    function _deployRitual(bytes32 glyph, uint256 allocation) internal {
        scrolls.push(Scroll(glyph, allocation));
        emit RitualDeployed(glyph, allocation);
    }

    function rebalanceScroll(bytes32 glyph, uint256 newAllocation) external onlySteward {
        for (uint256 i = 0; i < scrolls.length; i++) {
            if (scrolls[i].glyph == glyph) {
                scrolls[i].allocation = newAllocation;
                emit RitualDeployed(glyph, newAllocation);
                break;
            }
        }
    }

    function changeSteward(address newSteward) external onlySteward {
        require(newSteward != address(0), "Invalid steward address.");
        emit StewardChanged(steward, newSteward);
        steward = newSteward;
    }

    function getScrolls() external view returns (Scroll[] memory) {
        return scrolls;
    }
}
