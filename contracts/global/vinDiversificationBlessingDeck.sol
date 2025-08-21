// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract vinDiversificationBlessingDeck {
    struct PartnerBlessing {
        string country;
        string partnerOrg;
        string blessingType;
        uint256 initialAPR;
        uint256 updatedAPR;
        uint256 timestamp;
        string stewardNote;
    }

    PartnerBlessing[] public blessings;

    event BlessingActivated(string country, string partnerOrg, string blessingType, uint256 updatedAPR);

    function blessPartner(
        string memory _country,
        string memory _partnerOrg,
        string memory _blessingType,
        uint256 _initialAPR,
        uint256 _updatedAPR,
        string memory _stewardNote
    ) public {
        blessings.push(PartnerBlessing({
            country: _country,
            partnerOrg: _partnerOrg,
            blessingType: _blessingType,
            initialAPR: _initialAPR,
            updatedAPR: _updatedAPR,
            timestamp: block.timestamp,
            stewardNote: _stewardNote
        }));

        emit BlessingActivated(_country, _partnerOrg, _blessingType, _updatedAPR);
    }

    function getBlessings() public view returns (PartnerBlessing[] memory) {
        return blessings;
    }
}
