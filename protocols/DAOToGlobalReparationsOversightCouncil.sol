// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToGlobalReparationsOversightCouncil {
    string public batchID = "1321.9.103";
    string public steward = "Vinvin";

    address public admin;

    struct CouncilMember {
        address member;
        string nation;
        bool active;
    }

    CouncilMember[] public council;

    event MemberAdded(address indexed member, string nation);
    event MemberRemoved(address indexed member, string nation);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function addMember(address member, string memory nation) public onlyAdmin {
        council.push(CouncilMember(member, nation, true));
        emit MemberAdded(member, nation);
    }

    function removeMember(uint256 index) public onlyAdmin {
        CouncilMember storage m = council[index];
        m.active = false;
        emit MemberRemoved(m.member, m.nation);
    }

    function getCouncilMember(uint256 index) public view returns (address member, string memory nation, bool active) {
        CouncilMember memory m = council[index];
        return (m.member, m.nation, m.active);
    }
}
