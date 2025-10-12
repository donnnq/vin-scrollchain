// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DignityReentryPassportDAO {
    address public steward;

    struct Passport {
        address identity;
        string corridor;
        string emotionalTag;
        bool active;
        uint256 issuedAt;
    }

    mapping(address => Passport) public passports;

    event PassportIssued(address indexed identity, string corridor, string emotionalTag, uint256 issuedAt);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may issue dignity passports");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function issuePassport(address identity, string memory corridor, string memory emotionalTag) external onlySteward {
        passports[identity] = Passport({
            identity: identity,
            corridor: corridor,
            emotionalTag: emotionalTag,
            active: true,
            issuedAt: block.timestamp
        });

        emit PassportIssued(identity, corridor, emotionalTag, block.timestamp);
    }

    function getPassport(address identity) external view returns (string memory corridor, string memory emotionalTag, bool active, uint256 issuedAt) {
        Passport memory p = passports[identity];
        return (p.corridor, p.emotionalTag, p.active, p.issuedAt);
    }
}
