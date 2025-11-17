// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunalJusticeBroadcastProtocol {
    address public validator;

    struct Justice {
        string initiative;
        string impact;
        string resonance;
        uint256 timestamp;
    }

    Justice[] public broadcasts;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastJustice(string memory _initiative, string memory _impact, string memory _resonance) public onlyValidator {
        broadcasts.push(Justice(_initiative, _impact, _resonance, block.timestamp));
    }

    function getJustice(uint256 index) public view returns (Justice memory) {
        return broadcasts[index];
    }

    function totalBroadcasts() public view returns (uint256) {
        return broadcasts.length;
    }
}
