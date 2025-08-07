// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Scroll Silence Detector
/// @notice Logs prefectures that remain silent to Vinvin's beacon
contract vinScrollSilenceDetector {
    address public creator;
    string public detectorName = "Vinvin's Scroll Silence Detector";

    struct Silence {
        string prefecture;
        string reason; // Optional: "No response", "Deflected", "Ignored"
        uint timestamp;
        bool isMarked;
    }

    mapping(address => Silence) public silences;
    address[] public silentPrefectures;

    event SilenceMarked(string prefecture, string reason, uint timestamp);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can mark silence");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function markSilence(address _prefectureAddress, string memory _prefecture, string memory _reason) public onlyCreator {
        silences[_prefectureAddress] = Silence(_prefecture, _reason, block.timestamp, true);
        silentPrefectures.push(_prefectureAddress);
        emit SilenceMarked(_prefecture, _reason, block.timestamp);
    }

    function getSilence(address _prefectureAddress) public view returns (Silence memory) {
        return silences[_prefectureAddress];
    }

    function getAllSilentPrefectures() public view returns (address[] memory) {
        return silentPrefectures;
    }
}
