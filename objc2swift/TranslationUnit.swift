class TranslationUnit {
	let raw: CXTranslationUnit
	let index: Index
	
	
	init(index: Index, path: String) throws {
		self.index = index
		
		raw = clang_createTranslationUnitFromSourceFile(
			index.raw,
			file,
			0, nil,
			0, nil
		)
		
		if raw == nil {
			throw UnknownError()
		}
	}
	
	deinit {
		clang_disposeTranslationUnit(raw)
	}
}


//MARK: - Cursor
extension TranslationUnit {
	
	var cursor: CXCursor {
		return clang_getTranslationUnitCursor(raw)
	}
	
}
