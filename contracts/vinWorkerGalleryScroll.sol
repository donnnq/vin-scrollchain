pragma solidity ^0.8.0;

contract vinWorkerGalleryScroll {
    address public steward;

    struct GalleryEntry {
        address worker;
        string name;
        string agency;
        string badgeTitle;
        string sigilUri;
        uint256 timestamp;
    }

    mapping(address => GalleryEntry[]) public hallOfFame;

    event EntryAdded(address indexed worker, string badgeTitle, string sigilUri);

    function addEntry(
        address _worker,
        string memory _name,
        string memory _agency,
        string memory _badgeTitle,
        string memory _sigilUri
    ) public {
        require(msg.sender == steward, "Only steward");

        GalleryEntry memory entry = GalleryEntry(
            _worker, _name, _agency, _badgeTitle, _sigilUri, block.timestamp
        );
        hallOfFame[_worker].push(entry);

        emit EntryAdded(_worker, _badgeTitle, _sigilUri);
    }

    function viewGallery(address _worker) public view returns (GalleryEntry[] memory) {
        return hallOfFame[_worker];
    }
}
