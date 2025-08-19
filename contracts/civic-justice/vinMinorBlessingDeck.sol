// SPDX-License-Identifier: Civic-OS-Restoration-2025
pragma solidity ^0.8.19;

/**
 * @title vinMinorBlessingDeck
 * @author Vinvin, Mythic Scrollsmith
 * @notice Assigns civic badges and emotional glyphs to minors undergoing restoration
 * @dev Linked to vinRestorationProgressLedger.sol for milestone verification
 */

contract vinMinorBlessingDeck {

    address public stewardAddress;
    address public ledgerContract;

    struct Blessing {
        string badgeName; // e.g. "Empathy Initiate", "Civic Healer"
        string glyph;     // e.g. "🕊️", "🛡️", "🌱"
        string description;
        uint timestamp;
    }

    mapping(address => Blessing[]) public minorBlessings;

    modifier onlySteward() {
        require(msg.sender == stewardAddress, "Only civic steward may assign blessings");
        _;
    }

    constructor(address _ledgerContract) {
        stewardAddress = msg.sender;
        ledgerContract = _ledgerContract;
    }

    function assignBlessing(
        address _minorAddress,
        string memory _badgeName,
        string memory _glyph,
        string memory _description
    ) public onlySteward {
        Blessing memory newBlessing = Blessing({
            badgeName: _badgeName,
            glyph: _glyph,
            description: _description,
            timestamp: block.timestamp
        });

        minorBlessings[_minorAddress].push(newBlessing);
    }

    function getBlessings(address _minorAddress) public view returns (Blessing[] memory) {
        return minorBlessings[_minorAddress];
    }
}
