// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalBorderProtocolDAO {
    address public admin;

    struct BorderEntry {
        string region;
        string dataType;
        string controlMechanism;
        string emotionalTag;
        bool activated;
    }

    BorderEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _region, string memory _dataType, string memory _controlMechanism, string memory _emotionalTag) external onlyAdmin {
        protocols.push(BorderEntry(_region, _dataType, _controlMechanism, _emotionalTag, false));
    }

    function activateProtocol(uint256 index) external onlyAdmin {
        protocols[index].activated = true;
    }

    function getProtocol(uint256 index) external view returns (BorderEntry memory) {
        return protocols[index];
    }
}
