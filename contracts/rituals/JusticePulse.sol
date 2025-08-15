// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

interface INFTBlessing {
    function getBlessedTokens() external view returns (uint256[] memory);
    function getBlessing(uint256 tokenId) external view returns (
        uint256 tokenId,
        string memory caseId,
        uint256 emotionalAPR,
        string memory blessingNote,
        uint256 timestamp
    );
}

contract JusticePulse {
    address public steward;
    INFTBlessing public blessingContract;

    uint256 public totalEmotionalAPR;
    uint256 public totalBlessings;
    string[] public civicNotes;

    event PulseUpdated(uint256 totalAPR, uint256 totalBlessings);
    event CivicNoteLogged(string note);

    constructor(address _blessingContract) {
        steward = msg.sender;
        blessingContract = INFTBlessing(_blessingContract);
    }

    function updatePulse() public {
        require(msg.sender == steward, "Only steward can update");

        uint256[] memory tokens = blessingContract.getBlessedTokens();
        uint256 aprSum = 0;

        for (uint256 i = 0; i < tokens.length; i++) {
            (, , uint256 apr, string memory note, ) = blessingContract.getBlessing(tokens[i]);
            aprSum += apr;
            civicNotes.push(note);
        }

        totalEmotionalAPR = aprSum;
        totalBlessings = tokens.length;

        emit PulseUpdated(totalEmotionalAPR, totalBlessings);
    }

    function getPulse() public view returns (uint256 apr, uint256 blessings) {
        return (totalEmotionalAPR, totalBlessings);
    }

    function getCivicNotes() public view returns (string[] memory) {
        return civicNotes;
    }
}
