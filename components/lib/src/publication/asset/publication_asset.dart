// Copyright (c) 2021 Mantano. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:mno_commons_dart/utils/try.dart';
import 'package:mno_shared_dart/archive.dart';
import 'package:mno_shared_dart/src/mediatype/mediatype.dart';
import 'package:path/path.dart';

import '../../../fetcher.dart';
import '../../../publication.dart';

/// Represents a digital medium (e.g. a file) offering access to a publication. */
abstract class PublicationAsset {
  /// Name of the asset, e.g. a filename. */
  String get name;

  String toTitle() => basenameWithoutExtension(name).replaceAll("_", " ");

  /// Media type of the asset.
  ///
  /// If unknown, fallback on `MediaType.BINARY`.
  Future<MediaType> get mediaType;

  /// Creates a fetcher used to access the asset's content.
  Future<Try<Fetcher, OpeningException>> createFetcher(
      PublicationAssetDependencies dependencies, String credentials);
}

class PublicationAssetDependencies {
  final ArchiveFactory archiveFactory;

  PublicationAssetDependencies(this.archiveFactory);
}
