// SPDX-License-Identifier: PEACE
pragma solidity ^0.8.17;

contract vinPeacePact {
    address public scrollLord;

    struct NationSoul {
        string name;
        bool renouncedNuclearWeapons;
        uint256 honorScore;
    }

    mapping(address => NationSoul) public signatories;
    address[] public pactMembers;

    event PeaceVow(address indexed nation, string name, uint256 honorScore);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Uncertified pact guardian.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function vowPeace(address nation, string memory name) public onlyScrollLord {
        signatories[nation] = NationSoul(name, true, 100);
        pactMembers.push(nation);
        emit PeaceVow(nation, name, 100);
    }

    function viewNation(address nation) public view returns (NationSoul memory) {
        return signatories[nation];
    }

    function totalMembers() public view returns (uint256) {
        return pactMembers.length;
    }
}
