// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClosedDoorHearingOversightProtocolPackDAO {
    address public admin;

    struct ProtocolEntry {
        string hearingDate;
        string oversightMethod;
        string emotionalTag;
        bool reviewed;
    }

    ProtocolEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _hearingDate, string memory _oversightMethod, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_hearingDate, _oversightMethod, _emotionalTag, false));
    }

    function reviewProtocol(uint256 index) external onlyAdmin {
        protocols[index].reviewed = true;
    }

    function getProtocol(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
