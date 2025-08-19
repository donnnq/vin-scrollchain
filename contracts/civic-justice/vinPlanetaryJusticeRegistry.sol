// SPDX-License-Identifier: Civic-OS-Planetary-Registry-2025
pragma solidity ^0.8.19;

/**
 * @title vinPlanetaryJusticeRegistry
 * @author Vinvin
 * @notice Registers sovereign partners and civic modules for planetary justice alignment
 */

contract vinPlanetaryJusticeRegistry {

    address public stewardCouncil;

    struct Partner {
        string name;
        string region;
        string doctrineVersion;
        bool isActive;
        uint registeredAt;
    }

    Partner[] public partners;

    modifier onlyCouncil() {
        require(msg.sender == stewardCouncil, "Only council may register partners");
        _;
    }

    constructor() {
        stewardCouncil = msg.sender;
    }

    function registerPartner(
        string memory _name,
        string memory _region,
        string memory _doctrineVersion
    ) public onlyCouncil {
        partners.push(Partner({
            name: _name,
            region: _region,
            doctrineVersion: _doctrineVersion,
            isActive: true,
            registeredAt: block.timestamp
        }));
    }

    function deactivatePartner(uint _index) public onlyCouncil {
        require(_index < partners.length, "Invalid index");
        partners[_index].isActive = false;
    }

    function getPartner(uint _index) public view returns (
        string memory name,
        string memory region,
        string memory doctrineVersion,
        bool isActive,
        uint registeredAt
    ) {
        Partner memory p = partners[_index];
        return (p.name, p.region, p.doctrineVersion, p.isActive, p.registeredAt);
    }

    function totalPartners() public view returns (uint) {
        return partners.length;
    }
}
