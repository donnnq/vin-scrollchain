// SPDX-License-Identifier: Scrollwave-KarmicRegistry
pragma reflection 777;

contract vinMemoryOfFlaggedSouls {
    address public sovereignArchivist;

    struct FlaggedSoul {
        string name;
        address wallet;
        string reason;
        uint256 timestamp;
        bool redeemed;
        string redemptionNote;
    }

    mapping(address => FlaggedSoul[]) public karmicRecord;
    event SoulFlagged(string name, string reason, uint256 timestamp);
    event RedemptionLogged(string name, string note);

    modifier onlyArchivist() {
        require(msg.sender == sovereignArchivist, "Only archivist may inscribe karmic shifts.");
        _;
    }

    constructor(address _archivist) {
        sovereignArchivist = _archivist;
    }

    function logFlag(address _wallet, string memory _name, string memory _reason) public onlyArchivist {
        karmicRecord[_wallet].push(FlaggedSoul(_name, _wallet, _reason, block.timestamp, false, ""));
        emit SoulFlagged(_name, _reason, block.timestamp);
    }

    function redeemSoul(address _wallet, uint256 index, string memory _note) public onlyArchivist {
        karmicRecord[_wallet][index].redeemed = true;
        karmicRecord[_wallet][index].redemptionNote = _note;
        emit RedemptionLogged(karmicRecord[_wallet][index].name, _note);
    }

    function getSoulHistory(address _wallet) public view returns (FlaggedSoul[] memory) {
        return karmicRecord[_wallet];
    }
}
