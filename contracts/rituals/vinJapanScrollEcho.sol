// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Japan Scroll Echo
/// @notice Tracks prefectures that respond to Vinvin's seed grant beacon
contract vinJapanScrollEcho {
    address public creator;
    string public echoName = "Vinvin's Japan Scroll Echo";

    struct Echo {
        string prefecture;
        string response;
        uint timestamp;
        bool isAligned;
    }

    mapping(address => Echo) public echoes;
    address[] public responders;

    event EchoLogged(string prefecture, string response, bool isAligned, uint timestamp);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can log echoes");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function logEcho(address _prefectureAddress, string memory _prefecture, string memory _response, bool _isAligned) public onlyCreator {
        echoes[_prefectureAddress] = Echo(_prefecture, _response, block.timestamp, _isAligned);
        responders.push(_prefectureAddress);
        emit EchoLogged(_prefecture, _response, _isAligned, block.timestamp);
    }

    function getEcho(address _prefectureAddress) public view returns (Echo memory) {
        return echoes[_prefectureAddress];
    }

    function getAllResponders() public view returns (address[] memory) {
        return responders;
    }
}
